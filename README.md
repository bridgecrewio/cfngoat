# Cfngoat - Vulnerable Cloudformation Template
[![Maintained by Bridgecrew.io](https://img.shields.io/badge/maintained%20by-bridgecrew.io-blueviolet)](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=INFRASTRUCTURE+SECURITY)
[![CIS AWS](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=CIS+AWS+V1.2)
[![PCI-DSS](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=PCI-DSS+V3.2)
[![SOC2](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=SOC2)
[![ISO](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=ISO27001)
[![NIST-800-53](https://www.bridgecrew.cloud/badges/github/bridgecrewio/cfngoat/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=bridgecrewio%2Fcfngoat&benchmark=NIST-800-53)
[![Join us on Slack!](https://slack.bridgecrew.io/badge.svg)](https://slack.bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat)


Cfngoat is one  of Bridgecrew's "Vulnerable by Design" Infrastructure as Code repositories, a learning and training project that demonstrates how common configuration errors can find their way into production cloud environments.

![Cfngoat](.github/cfngoat-removebg-preview.png)

It's an ideal companion to testing build time Infrastructure as Code scanning tools, such as [Bridgecrew](https://bridgecrew.io/) & [Checkov](https://checkov.io) 

## Table of Contents

* [Introduction](#introduction)
* [Installation](#Installation)
* [Contributing](#contributing)
* [Support](#support)

## Introduction

Cfngoat was built to enable DevSecOps design and implement a sustainable misconfiguration prevention strategy. It can be used to test a policy-as-code framework like  [Bridgecrew](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat) & [Checkov](https://github.com/bridgecrewio/checkov/), inline-linters, pre-commit hooks or other code scanning methods.

Cfngoat follows the tradition of existing *Goat projects that provide a baseline training ground to practice implementing secure development best practices for cloud infrastructure.


## Installation
 
```bash
aws cloudformation create-stack --stack-name cfngoat --template-body file://cfngoat.yaml --region us-east-1 --parameters ParameterKey=Password,ParameterValue=MyPassword10 --capabilities CAPABILITY_NAMED_IAM
```

Expect provisioning to take at least 5 minutes.  

Multiple stacks can be deployed simultaniously by changing the `--stack-name` and adding an `Environment` parameter:

```bash
aws cloudformation create-stack --stack-name cfngoat2 --template-body file://cfngoat.yaml --region us-east-1 --parameters ParameterKey=Password,ParameterValue=MyPassword10 ParameterKey=Environment,ParameterValue=dev2 --capabilities CAPABILITY_NAMED_IAM
```

## Important notes

* **Where to get help:** the [Bridgecrew Community Slack](https://slack.bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat)

Before you proceed please take a not of these warning:
> :warning: Cfngoat creates intentionally vulnerable AWS resources into your account. **DO NOT deploy Cfngoat in a production environment or alongside any sensitive AWS resources.**

## Requirements

* aws cli


## Bridgecrew's IaC herd of goats

* [CfnGoat](https://github.com/bridgecrewio/cfngoat) - Vulnerable by design Cloudformation template
* [TerraGoat](https://github.com/bridgecrewio/terragoat) - Vulnerable by design Terraform stack
* [CDKGoat](https://github.com/bridgecrewio/cdkgoat) - Vulnerable by design CDK application

## Contributing

Contribution is welcomed!

We would love to hear about more ideas on how to find vulnerable infrastructure-as-code design patterns.

## Support

[Bridgecrew](https://bridgecrew.io/?utm_source=github&utm_medium=organic_oss&utm_campaign=cfngoat) builds and maintains Cfngoat to encourage the adoption of policy-as-code.

If you need direct support you can contact us at [info@bridgecrew.io](mailto:info@bridgecrew.io).

## Existing vulnerabilities (Auto-Generated)

|    | check_id   | file          | resource                          | check_name                                                                                                                                                                                               | guideline                                                          |
|----|------------|---------------|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
|  0 | CKV_AWS_58 | /eks.yaml     | AWS::EKS::Cluster.EKSCluster      | Ensure EKS Cluster has Secrets Encryption Enabled                                                                                                                                                        | https://docs.bridgecrew.io/docs/bc_aws_kubernetes_3                |
|  1 | CKV_AWS_3  | /cfngoat.yaml | AWS::EC2::Volume.WebHostStorage   | Ensure all data stored in the EBS is securely encrypted                                                                                                                                                  | https://docs.bridgecrew.io/docs/general_3-encrypt-eps-volume       |
|  2 | CKV_AWS_23 | /cfngoat.yaml | AWS::EC2::SecurityGroup.WebNodeSG | Ensure every security groups rule has a description                                                                                                                                                      | https://docs.bridgecrew.io/docs/networking_31                      |
|  3 | CKV_AWS_24 | /cfngoat.yaml | AWS::EC2::SecurityGroup.WebNodeSG | Ensure no security groups allow ingress from 0.0.0.0:0 to port 22                                                                                                                                        | https://docs.bridgecrew.io/docs/networking_1-port-security         |
|  4 | CKV_AWS_21 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure the S3 bucket has versioning enabled                                                                                                                                                              | https://docs.bridgecrew.io/docs/s3_16-enable-versioning            |
|  5 | CKV_AWS_53 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.bridgecrew.io/docs/bc_aws_s3_19                       |
|  6 | CKV_AWS_18 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/s3_13-enable-logging               |
|  7 | CKV_AWS_56 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.bridgecrew.io/docs/bc_aws_s3_22                       |
|  8 | CKV_AWS_55 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/bc_aws_s3_21                       |
|  9 | CKV_AWS_54 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.bridgecrew.io/docs/bc_aws_s3_20                       |
| 10 | CKV_AWS_19 | /cfngoat.yaml | AWS::S3::Bucket.FlowBucket        | Ensure the S3 bucket has server-side-encryption enabled                                                                                                                                                  | https://docs.bridgecrew.io/docs/s3_14-data-encrypted-at-rest       |
| 11 | CKV_AWS_40 | /cfngoat.yaml | AWS::IAM::Policy.UserPolicy       | Ensure IAM policies are attached only to groups or roles (Reducing access management complexity may in-turn reduce opportunity for a principal to inadvertently receive or retain excessive privileges.) | https://docs.bridgecrew.io/docs/iam_16-iam-policy-privileges-1     |
| 12 | CKV_AWS_7  | /cfngoat.yaml | AWS::KMS::Key.LogsKey             | Ensure rotation for customer created CMKs is enabled                                                                                                                                                     | https://docs.bridgecrew.io/docs/logging_8                          |
| 13 | CKV_AWS_17 | /cfngoat.yaml | AWS::RDS::DBInstance.DefaultDB    | Ensure all data stored in the RDS bucket is not public accessible                                                                                                                                        | https://docs.bridgecrew.io/docs/public_2                           |
| 14 | CKV_AWS_16 | /cfngoat.yaml | AWS::RDS::DBInstance.DefaultDB    | Ensure all data stored in the RDS is securely encrypted at rest                                                                                                                                          | https://docs.bridgecrew.io/docs/general_4                          |
| 15 | CKV_AWS_23 | /cfngoat.yaml | AWS::EC2::SecurityGroup.DefaultSG | Ensure every security groups rule has a description                                                                                                                                                      | https://docs.bridgecrew.io/docs/networking_31                      |
| 16 | CKV_AWS_21 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure the S3 bucket has versioning enabled                                                                                                                                                              | https://docs.bridgecrew.io/docs/s3_16-enable-versioning            |
| 17 | CKV_AWS_53 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.bridgecrew.io/docs/bc_aws_s3_19                       |
| 18 | CKV_AWS_18 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/s3_13-enable-logging               |
| 19 | CKV_AWS_56 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.bridgecrew.io/docs/bc_aws_s3_22                       |
| 20 | CKV_AWS_55 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/bc_aws_s3_21                       |
| 21 | CKV_AWS_54 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.bridgecrew.io/docs/bc_aws_s3_20                       |
| 22 | CKV_AWS_20 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure the S3 bucket does not allow READ permissions to everyone                                                                                                                                         | https://docs.bridgecrew.io/docs/s3_1-acl-read-permissions-everyone |
| 23 | CKV_AWS_19 | /cfngoat.yaml | AWS::S3::Bucket.DataBucket        | Ensure the S3 bucket has server-side-encryption enabled                                                                                                                                                  | https://docs.bridgecrew.io/docs/s3_14-data-encrypted-at-rest       |
| 24 | CKV_AWS_21 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure the S3 bucket has versioning enabled                                                                                                                                                              | https://docs.bridgecrew.io/docs/s3_16-enable-versioning            |
| 25 | CKV_AWS_53 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.bridgecrew.io/docs/bc_aws_s3_19                       |
| 26 | CKV_AWS_18 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/s3_13-enable-logging               |
| 27 | CKV_AWS_56 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.bridgecrew.io/docs/bc_aws_s3_22                       |
| 28 | CKV_AWS_55 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/bc_aws_s3_21                       |
| 29 | CKV_AWS_54 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.bridgecrew.io/docs/bc_aws_s3_20                       |
| 30 | CKV_AWS_19 | /cfngoat.yaml | AWS::S3::Bucket.FinancialsBucket  | Ensure the S3 bucket has server-side-encryption enabled                                                                                                                                                  | https://docs.bridgecrew.io/docs/s3_14-data-encrypted-at-rest       |
| 31 | CKV_AWS_53 | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket  | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.bridgecrew.io/docs/bc_aws_s3_19                       |
| 32 | CKV_AWS_18 | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket  | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/s3_13-enable-logging               |
| 33 | CKV_AWS_56 | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket  | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.bridgecrew.io/docs/bc_aws_s3_22                       |
| 34 | CKV_AWS_55 | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket  | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/bc_aws_s3_21                       |
| 35 | CKV_AWS_54 | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket  | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.bridgecrew.io/docs/bc_aws_s3_20                       |
| 36 | CKV_AWS_19 | /cfngoat.yaml | AWS::S3::Bucket.OperationsBucket  | Ensure the S3 bucket has server-side-encryption enabled                                                                                                                                                  | https://docs.bridgecrew.io/docs/s3_14-data-encrypted-at-rest       |
| 37 | CKV_AWS_53 | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.bridgecrew.io/docs/bc_aws_s3_19                       |
| 38 | CKV_AWS_56 | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.bridgecrew.io/docs/bc_aws_s3_22                       |
| 39 | CKV_AWS_55 | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/bc_aws_s3_21                       |
| 40 | CKV_AWS_54 | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.bridgecrew.io/docs/bc_aws_s3_20                       |
| 41 | CKV_AWS_19 | /cfngoat.yaml | AWS::S3::Bucket.DataScienceBucket | Ensure the S3 bucket has server-side-encryption enabled                                                                                                                                                  | https://docs.bridgecrew.io/docs/s3_14-data-encrypted-at-rest       |
| 42 | CKV_AWS_53 | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket        | Ensure S3 bucket has block public ACLS enabled                                                                                                                                                           | https://docs.bridgecrew.io/docs/bc_aws_s3_19                       |
| 43 | CKV_AWS_18 | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket        | Ensure the S3 bucket has access logging enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/s3_13-enable-logging               |
| 44 | CKV_AWS_56 | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket        | Ensure S3 bucket has 'restrict_public_bucket' enabled                                                                                                                                                    | https://docs.bridgecrew.io/docs/bc_aws_s3_22                       |
| 45 | CKV_AWS_55 | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket        | Ensure S3 bucket has ignore public ACLs enabled                                                                                                                                                          | https://docs.bridgecrew.io/docs/bc_aws_s3_21                       |
| 46 | CKV_AWS_54 | /cfngoat.yaml | AWS::S3::Bucket.LogsBucket        | Ensure S3 bucket has block public policy enabled                                                                                                                                                         | https://docs.bridgecrew.io/docs/bc_aws_s3_20                       |


---


