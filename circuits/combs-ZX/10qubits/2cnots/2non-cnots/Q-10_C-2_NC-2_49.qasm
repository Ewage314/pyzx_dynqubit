OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[0];
x q[4];
x q[7];
cx q[8], q[3];
