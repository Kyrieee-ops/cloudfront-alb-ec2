#------------------------------------
# Certificate
# 東京リージョンで指定されたドメインに対するSSL/TLS証明書を作成し、
# その証明書のライフサイクルを管理する
#------------------------------------
# 東京リージョン用
resource "aws_acm_certificate" "tokyo_cert" {
  domain_name       = var.domain
  validation_method = "DNS"

  tags = {
    Name    = "${var.domain}-sslcert"
    Project = var.domain
  }

# 証明書のライフサイクル管理 -> 新しい証明書を作成してから古い証明書を削除
  lifecycle {
    create_before_destroy = true
  }
  # この証明書の作成が依存するリソース -> route53
  depends_on = [
    aws_route53_zone.route53_zone
  ]
}