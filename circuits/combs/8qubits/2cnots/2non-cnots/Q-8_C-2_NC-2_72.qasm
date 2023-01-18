OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[5], q[1];
x q[6];
x q[4];
cx q[5], q[3];
