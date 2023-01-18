OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
cx q[4], q[3];
cx q[6], q[8];
