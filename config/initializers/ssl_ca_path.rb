ca_file = '/etc/ssl/certs/ca-certificates.crt'
ca_dir  = '/etc/ssl/certs'

ENV['SSL_CERT_FILE'] ||= ca_file
ENV['SSL_CERT_DIR']  ||= ca_dir

# 念のための保険（既定 SSLContext も上書き）
require 'openssl'
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_file] = ca_file
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_path] = ca_dir
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:verify_mode] = OpenSSL::SSL::VERIFY_PEER