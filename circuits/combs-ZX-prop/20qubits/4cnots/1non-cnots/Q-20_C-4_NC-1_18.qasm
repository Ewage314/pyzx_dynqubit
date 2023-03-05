OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[15];
cx q[7], q[1];
cx q[3], q[0];
x q[15];
cx q[16], q[14];
