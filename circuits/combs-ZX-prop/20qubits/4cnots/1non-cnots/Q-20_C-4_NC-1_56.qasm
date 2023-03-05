OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[18];
x q[5];
cx q[2], q[0];
cx q[13], q[14];
cx q[7], q[6];
