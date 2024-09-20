resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = local.zone_id
  #backend.daws81s.site
  name    = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].private_ip] : [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}    