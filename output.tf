output "alb_dns_name" {
  value = aws_lb.ext-alb.dns_name
}

output "aws_lb_target_group_arn" {
  value = aws_lb_target_group.nginx-tgt.arn

}
output "availability_zone" {
  value = data.aws_availability_zones.available.names

}