#------------------------------------
# route53
# force_destroy -> 既存のホストゾーンが作成されている場合に強制削除するか
#------------------------------------
resource "aws_route53_zone" "route53_zone" {
  name          = var.domain
  force_destroy = false
  tags = {
    Name    = "${var.project}-domain"
    Project = var.project
  }
}