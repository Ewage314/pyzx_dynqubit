OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[4], q[6];
x q[1];
x q[1];
cx q[6], q[8];
cx q[4], q[7];
