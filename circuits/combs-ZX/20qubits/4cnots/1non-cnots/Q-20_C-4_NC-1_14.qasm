OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[15];
cx q[17], q[7];
cx q[14], q[13];
z q[7];
cx q[7], q[17];
