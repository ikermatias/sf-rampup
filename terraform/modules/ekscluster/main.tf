
resource "aws_eks_cluster" "eks" {

  name     = var.name
  role_arn = aws_iam_role.eksRole.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
  depends_on = [
    aws_iam_role_policy_attachment.eksAttachPolicy
    #aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}

resource "aws_iam_role" "eksRole" {
  name = "eksRole"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eksAttachPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eksRole.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
#resource "aws_iam_role_policy_attachment" "example-AmazonEKSVPCResourceController" {
##  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
# role       = aws_iam_role.example.name
#}