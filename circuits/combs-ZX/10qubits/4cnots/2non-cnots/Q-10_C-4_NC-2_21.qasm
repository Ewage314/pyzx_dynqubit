OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
cx q[8], q[0];
cx q[3], q[4];
x q[8];
cx q[1], q[3];
cx q[6], q[2];
