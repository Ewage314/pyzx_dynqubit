OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
cx q[2], q[1];
cx q[8], q[7];
cx q[8], q[5];
cx q[3], q[0];
