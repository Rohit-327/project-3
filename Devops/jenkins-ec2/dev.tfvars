ami                    = "ami-0e449927258d45bc4"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-05c3c3b1017505216"]
key_name               = "project-3"
subnet_id              = "subnet-053102deb28c03964"
iam_instance_profile   = "admin_role"
name                   = "R-jenkins-ec2"
project_name           = "DevOps"
env                    = "dev"
user_data              = <<-EOF
  #!/bin/bash
  sudo yum update -y

  # Install Java 17 (Amazon Corretto)
  sudo amazon-linux-extras enable corretto17
  sudo yum install -y java-17-amazon-corretto

  # Install Jenkins
  wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  sudo yum install -y jenkins

  # Enable and start Jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
EOF
