resource "aws_autoscaling_group" "main" {
  name                      = replace(local.name, "rtype", "asg")
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = var.desired_size
  force_delete              = true
  launch_configuration      = aws_launch_configuration.main.name
  vpc_zone_identifier       = [ data.terraform_remote_state.vpc.outputs.public_subnet1_id, data.terraform_remote_state.vpc.outputs.public_subnet2_id, data.terraform_remote_state.vpc.outputs.public_subnet3_id ]



  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50

    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.main.id
  lb_target_group_arn    = data.terraform_remote_state.alb.outputs.lb_target_group_arn
}