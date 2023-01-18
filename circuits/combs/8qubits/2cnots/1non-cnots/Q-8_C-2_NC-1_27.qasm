OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[2];
cx q[6], q[4];
cx q[5], q[0];
