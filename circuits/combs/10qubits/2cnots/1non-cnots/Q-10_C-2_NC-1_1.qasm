OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
cx q[3], q[4];
cx q[9], q[0];
