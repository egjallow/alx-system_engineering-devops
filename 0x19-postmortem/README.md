#Postmortem Report: Connection Refused Error

##Issue Summary:

Duration: The outage occurred on August 18, 2024, from 10:00 AM to 10:45 AM (UTC).

Impact: The web service hosted on the server became inaccessible, affecting approximately 80% of users. Users attempting to access the service received a "Connection Refused" error. As a result, all HTTP requests to the service failed, leading to a complete service outage for 45 minutes.

Root Cause: The root cause of the issue was an incorrect network address configuration in the system’s curl command. The command was set to connect to 0:80, which is not a valid or routable IP address, causing the connection to fail.

##Timeline:

10:00 AM - Issue detected via monitoring alert indicating that HTTP requests to the service were failing.
10:02 AM - Initial investigation began; the web server logs were reviewed, and network configurations were checked.
10:10 AM - The network team was alerted and began investigating potential firewall issues.
10:20 AM - The team discovered that the curl command was configured with an invalid address (0:80).
10:25 AM - The web server configuration was reviewed and corrected to use localhost:80 instead of 0:80.
10:30 AM - Services were restarted to apply the configuration changes.
10:45 AM - Issue resolved, and normal service was restored.
Root Cause and Resolution:

Root Cause: The issue was caused by an incorrect IP address (0) being used in the curl command to access the service on port 80. The address 0 is not a valid IP address and led to the connection being refused by the system. The configuration error was introduced during a recent update to the system’s environment variables.

Resolution: The resolution involved identifying the incorrect IP address in the curl command and updating it to localhost:80, a valid and routable address for the local server. Once the configuration was corrected, the web server was restarted, and connectivity was restored. The service was tested to confirm that it was functioning correctly, and the incident was closed after monitoring confirmed stability.

Corrective and Preventative Measures:

##Improvement Areas:

Enhance the validation of environment variables before deployment to catch configuration errors.
Improve the monitoring system to detect similar issues earlier and more accurately.
Conduct a review of all curl commands used across the system to ensure proper IP addresses are used.
Action Items:

Patch Nginx Server: Update the Nginx server configuration to include additional validation checks.
Add Monitoring: Implement monitoring on the server’s curl commands to detect invalid addresses and trigger alerts.
Review Deployment Process: Update the deployment checklist to include a step for verifying environment variable configurations.
Team Training: Conduct a training session for the engineering team on best practices for configuring network addresses.

