resource "aws_iam_role" "mgn_agent" {
  name = "mgn-demo-agent-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "mgn_agent" {
  role       = aws_iam_role.mgn_agent.name
  policy_arn = "arn:aws:iam::aws:policy/AWSApplicationMigrationAgentPolicy"
}

resource "aws_iam_instance_profile" "mgn_agent" {
  name = "mgn-demo-agent-profile"
  role = aws_iam_role.mgn_agent.name

  tags = local.common_tags
}
