module "vpc" {
  source               = "./modules/vpc"
  project              = "myapp"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_a_cidr = "10.0.1.0/24"
  public_subnet_b_cidr = "10.0.2.0/24"
}

module "sg" {
  source        = "./modules/security_groups"
  project       = "myapp"
  vpc_id        = module.vpc.vpc_id
  allowed_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "ec2" {
  source            = "./modules/ec2"
  project           = "myapp"
  subnet_ids        = module.vpc.public_subnets
  security_group_id = module.sg.security_group_id
}

module "s3" {
  source      = "./modules/s3"
  project     = "myapp"
  bucket_name = "myapp-${random_id.bucket.hex}"
}

resource "random_id" "bucket" {
  byte_length = 4
}
