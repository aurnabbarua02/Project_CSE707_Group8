# Project_CSE707_Group8

This project is a Flutter-based application that simulates a secure
digital banking system. The application allows users to log in, view their
account balance, and transfer money to other registered users within the system.
The main objective of the project is to demonstrate how secure money transfer
can be achieved using an intermediary-based transaction flow rather than a
direct peer-to-peer transfer.

After logging into the system, a user can see their available bank balance and
initiate a money transfer to another user. Instead of sending money directly
from one user account to another, the transaction passes through three
intermediate connectors. The flow is as follows: the sender’s bank transfers the
amount to Connector 1, Connector 1 forwards it to Connector 2, Connector 2 then
sends it to Connector 3, and finally Connector 3 transfers the money to the
receiver’s bank account. These connectors are assumed to be highly secure and
trusted entities, which helps improve transaction safety and reduce fraud risks.

This project relates to distributed systems because the transaction process is
distributed across multiple independent components (connectors) rather than
being handled by a single centralized system. Each connector can be considered
a separate node in a distributed network, and the transaction progresses step
by step across these nodes. This approach reflects real-world distributed
financial systems, where multiple intermediaries and verification layers are
used to ensure consistency, fault tolerance, and security.

As part of this project, we performed several tasks including application design,
coding, configuration, and testing. The frontend was developed using Flutter,
with user authentication, balance display, and transaction interfaces
implemented in code. We also designed the logical transaction flow involving
multiple connectors to simulate a distributed transaction pipeline. The project
environment was configured, dependencies were managed, and the application was
tested using predefined test credentials to replicate real usage scenarios.

Video Demonstration: 
--------------------
[![Link](https://img.youtube.com/vi/Ir21GbksqW0/0.jpg)](https://youtube.com/shorts/Ir21GbksqW0?feature=share)

Author Information:
-------------------
Name: Aurnab Barua, Email: aurnab.barua@g.bracu.ac.bd

Name: Emadul Islam, Email: emadul.islam@g.bracu.ac.bd

