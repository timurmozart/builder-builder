FROM centos:centos7
WORKDIR /root/
ENV GO111MODULE="on"
RUN curl -LO https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
RUN tar -C /usr/bin -xzf go1.14.2.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/bin/go/bin
RUN yum install -y yum-utils
RUN yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install docker-ce docker-ce-cli containerd.io -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN (cd /usr/bin && curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash)
RUN curl -L https://go.kubebuilder.io/dl/2.3.1/linux/amd64 | tar -xz -C /tmp/
RUN mv /tmp/kubebuilder_2.3.1_linux_amd64 /usr/local/kubebuilder
RUN export PATH=$PATH:/usr/local/kubebuilder/bin
RUN yum install gcc -y
# RUN go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.25.1
# RUN export PATH=$PATH:/root/go/bin:
