OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[7];
z q[13];
cx q[11], q[17];
cx q[5], q[6];
x q[7];
cx q[8], q[1];
