# AWS上にterraformで新しい環境を作成するツール

# 構成

```
.
├── vpc
│   |── 00_aws.tf
│   ├── 01_vpc.tf
│   ├── 02_subnet.tf
│   ├── 03_gateway.tf
│   ├── 04_routetable.tf
│   └── variables.tf
├── security_group
│   ├── 00_aws.tf
│   ├── 01_sg_elb.tf
│   ├── 02_sg_ec2.tf
│   ├── 03_sg_rds.tf
│   ├── 04_sg_lambda.tf
│   └── variables.tf
└── README.md
```

## vpc

VPCとネットワーク系のリソースを構築する

### 00_aws.tf

使用するregionの指定

### 01_vpc.tf

- 192.168.0.0/21
- DNSホスト名：はい
- 作成したDHCP Options Set (default)

### 02_subnet.tf

２つのAZに作成（-a, -c）。計６個。
- public：内⇔外
  - 192.168.0.0/24
  - 192.168.0.1/24
  - Internet Gatewayをルーティングしたrtbを設定
- protected：内⇒外
  - 192.168.2.0/24
  - 192.168.3.0/24
  - Nat Gatewayをルーティングしたrtbを設定
- private：内のみ
  - 192.168.4.0/24
  - 192.168.5.0/24
  - デフォルト同様の内容のrtbを設定

### 03_gateway.tf

- Nat Gateway用にElasticIPを新規取得
- Internet GatewayをVPCにアタッチ
- Public-aのサブネット新規取得したEIPを設定

### 04_routetable.tf
- Public
  - Internet Gatewayをルーティング
  - Public Subnetに関連付け
- Protected
  - Nat Gatewayをルーティング
  - Protected Subnetに関連付け
- Private
  - デフォルト同様
  - Private Subnetに関連付け
### variables.tf

変数値を設定

### 実行

.tfstateファイルの管理はしていないので、必ず実行するディレクトリにある.tfstateファイルを削除してから実行すること

```bash
$ cd vpc
$ terraform plan
$ terraform apply
$ terraform destroy # リソースを削除   
```

## security_group

### 00_aws.tf

使用するregionの指定

### 01_sg_elb.tf

elb用sg

### 02_sg_ec2.tf

EC2用sg

### 03_sg_rds.tf

rds用sg

### 04_sg_lambda.tf

lambda用sg

### variables.tf

変数値を設定

### 実行

.tfstateファイルの管理はしていないので、必ず実行するディレクトリにある.tfstateファイルを削除してから実行すること

```bash
$ cd security_group
$ terraform plan
$ terraform apply
$ terraform destroy # リソースを削除
```
