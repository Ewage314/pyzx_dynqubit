OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[7];
cx q[10], q[17];
cx q[12], q[5];
z q[13];
cx q[14], q[1];
