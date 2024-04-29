<h1 align="center">
  Network Traffic Analyzer
</h1>

<h4 align="center">A Bash script designed to analyze network traffic captured in a pcap file.</h4>

## Table of Contents:
- [Introduction](#introduction)
- [Explanation](#explanation)
- [Prerequisites](#prerequisites)
- [Usage](#usage)

## Introduction:
This document presents a Bash script designed to analyze network traffic captured in a pcap file. The script accepts a relative path to the pcap file as an argument and calculates the total number of packets for specific protocols (HTTP/HTTPS). Additionally, it identifies the top 5 source and destination IP addresses associated with these packets.
## Explanation:
The script accepts a relative pcap file path as an argument. Using tshark, a packet analysis tool, the script filters the packets in the pcap file to include only those associated with HTTP and HTTPS protocols. This filtering is accomplished by specifying appropriate display filters (http for HTTP and tls for HTTPS) in the tshark command.Once the packets are filtered, the script counts the total number of packets for each protocol using the wc -l command. For both HTTP and HTTPS packets, the script extracts the source and destination IP addresses using tshark. It then sorts the IP addresses and removes duplicates using standard Unix commands like sort and uniq. Finally the script utilizes the head command to display only the top 5 source and destination IP addresses.
## Prerequisites:
1. Bash shell environment.
2. Installation of tshark for capturing and analyzing network traffic.

## Usage:
1. **Installing tshark:**
```
# Debian
sudo apt-get install tshark
```
```
# Arch
sudo pacman -S tshark
```
```
# RedHat
sudo dnf install wireshark-cli
```
2. **Making Script User Executable:**
```
chmod u+x network-traffic-analyzer.sh
```
3. **Running the Script:**
```
./network-traffic-analyzer.sh <pcap_file>
```
