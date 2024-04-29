#!/bin/bash

# Bash Script to Analyze Network Traffic

# Input: Path to the Wireshark pcap file

pcap_file=$1 # capture input from terminal.

# Function to extract information from the pcap file
analyze_traffic() {
    # Use tshark or similar commands for packet analysis.
    # Consider commands to count total packets, filter by protocols (HTTP, HTTPS/TLS),
    declare -i PACKETS_COUNT=$(tshark -r $pcap_file -Y "http or tls" | wc -l);
    declare -i HTTP_COUNT=$(tshark -r $pcap_file -Y "http" | wc -l)
    declare -i HTTPS_COUNT=$(tshark -r $pcap_file -Y "tls" | wc -l) 
    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Provide summary information based on your analysis
    # Hints: Total packets, protocols, top source, and destination IP addresses.
    echo "1. Total Packets: ${PACKETS_COUNT}"
    echo "2. Protocols:"
    echo "   - HTTP: ${HTTP_COUNT} packets"
    echo "   - HTTPS/TLS: ${HTTPS_COUNT} packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    # Filtering top 5 Source IP addresses  and their packet count  and saving them into temporary file.
    tshark -r $pcap_file -T fields -e ip.src -Y "http or tls" | sort | uniq -c | sort -nr | head -5 > temp.txt
    # Reading the temporay file to extract source IP addresses and packet count.
    while IFS= read -r line; do
	    echo "- ${line##* }: ${line% *} packets"
    done < "temp.txt"
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    # Filtering top 5 destination IP and their packet count  and saving them into temporary file.
    tshark -r $pcap_file -T fields -e ip.dst -Y "http or tls" | sort | uniq -c | sort -nr | head -5 > temp.txt
    # Reading the temporay file to extract destination IP addresses and packet count.
    while IFS= read -r line; do
	    echo "- ${line##* }: ${line% *} packets"
    done < "temp.txt"
    # Deleting temporary file.
    rm temp.txt
    echo ""
    echo "----- End of Report -----"
}

# Run the analysis function
analyze_traffic

