# # encoding: utf-8

# Inspec test for recipe idea::Windows

describe package('IntelliJ IDEA 2016.3.5') do
  it { should be_installed }
end