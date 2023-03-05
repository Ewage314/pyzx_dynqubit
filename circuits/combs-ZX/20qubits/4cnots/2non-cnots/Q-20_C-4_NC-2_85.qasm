OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[19];
cx q[16], q[7];
x q[3];
x q[8];
cx q[3], q[12];
cx q[7], q[12];
