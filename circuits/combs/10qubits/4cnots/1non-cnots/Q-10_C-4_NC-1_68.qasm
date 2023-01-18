OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[4];
x q[1];
cx q[8], q[7];
