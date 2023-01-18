OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[3];
x q[6];
cx q[8], q[1];
cx q[8], q[7];
cx q[1], q[6];
