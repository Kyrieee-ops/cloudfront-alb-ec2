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

#------------------------------------
# route53 record
# aws_route53_zoneではホストゾーンにド独自ドメインを設定し、
# その独自ドメインになんのAWSリソースのDNS名を紐づけるかをaws_route53_recordで設定する
#------------------------------------
resource "aws_route53_record" "aws_route53_record" {
  zone_id = aws_route53_zone.route53_zone.id
  name    = var.domain
  type    = "A"

  # ここはCloudFrontのドメイン名を指定する (現時点ではALBに紐づけている)
  alias {
    name                   = aws_lb.cloudtech_alb.dns_name
    zone_id                = aws_lb.cloudtech_alb.zone_id
    evaluate_target_health = true
  }
}