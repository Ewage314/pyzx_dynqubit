OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[15], q[17];
z q[3];
cx q[17], q[14];
cx q[6], q[3];
