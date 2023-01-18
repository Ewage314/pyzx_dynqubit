OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[3];
x q[7];
cx q[1], q[5];
cx q[1], q[8];
cx q[4], q[0];
