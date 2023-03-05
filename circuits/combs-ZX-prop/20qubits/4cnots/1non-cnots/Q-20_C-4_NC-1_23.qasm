OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[14];
cx q[18], q[11];
x q[15];
cx q[4], q[12];
cx q[18], q[6];
