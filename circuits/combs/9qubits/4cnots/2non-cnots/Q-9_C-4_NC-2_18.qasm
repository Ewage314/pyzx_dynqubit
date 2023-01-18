OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[8];
x q[7];
cx q[7], q[4];
cx q[7], q[4];
cx q[4], q[0];
cx q[3], q[7];
