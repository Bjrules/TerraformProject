output "ALB-sg" {
  value = aws_security_group.BB["ext-alb-sg"].id
}


output "IALB-sg" {
  value = aws_security_group.BB["int-alb-sg"].id
}


output "bastion-sg" {
  value = aws_security_group.BB["bastion-sg"].id
}


output "nginx-sg" {
  value = aws_security_group.BB["nginx-sg"].id
}


output "web-sg" {
  value = aws_security_group.BB["webserver-sg"].id
}


output "datalayer-sg" {
  value = aws_security_group.BB["datalayer-sg"].id
}

output "compute-sg" {
  value = aws_security_group.BB["compute-sg"].id
}
