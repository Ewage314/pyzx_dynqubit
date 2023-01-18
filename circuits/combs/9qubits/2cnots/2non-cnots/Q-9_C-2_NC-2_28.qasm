OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
x q[1];
cx q[5], q[6];
cx q[7], q[4];
