OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[8];
x q[4];
cx q[3], q[5];
cx q[6], q[2];
cx q[3], q[7];
