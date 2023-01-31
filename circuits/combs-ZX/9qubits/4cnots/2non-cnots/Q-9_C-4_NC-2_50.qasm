OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[4];
cx q[7], q[3];
x q[7];
cx q[6], q[8];
x q[7];
cx q[5], q[8];
