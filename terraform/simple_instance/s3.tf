provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "c3011ac5495ae3809ce7794dc9249c05f46daf21"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-16 07:52:53"
    git_last_modified_by = "vinay.munivenkata@gmail.com"
    git_modifiers        = "vinay.munivenkata"
    git_org              = "Vinay7820"
    git_repo             = "cfngoat"
    yor_trace            = "28958f85-4eba-4997-ab3d-2758580d3e8e"
  }
}
