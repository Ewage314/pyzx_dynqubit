OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[2], q[0];
x q[6];
cx q[6], q[7];
