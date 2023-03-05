OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[0];
x q[15];
cx q[18], q[11];
cx q[5], q[17];
cx q[15], q[7];
