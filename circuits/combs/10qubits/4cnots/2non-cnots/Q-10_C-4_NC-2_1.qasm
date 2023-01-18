OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
cx q[5], q[7];
cx q[4], q[8];
cx q[6], q[5];
x q[0];
cx q[6], q[7];
