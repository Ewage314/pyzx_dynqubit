OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[1];
x q[3];
cx q[6], q[8];
