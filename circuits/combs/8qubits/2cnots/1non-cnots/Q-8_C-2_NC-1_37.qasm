OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[5], q[4];
x q[5];
cx q[5], q[3];
