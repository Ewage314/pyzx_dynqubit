OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[6], q[3];
x q[7];
cx q[6], q[2];
