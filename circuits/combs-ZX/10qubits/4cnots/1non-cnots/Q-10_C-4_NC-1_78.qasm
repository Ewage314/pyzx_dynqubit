OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[9];
cx q[7], q[3];
cx q[1], q[7];
x q[8];
cx q[7], q[4];
