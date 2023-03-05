OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[17];
cx q[18], q[15];
cx q[1], q[3];
x q[12];
cx q[13], q[15];
