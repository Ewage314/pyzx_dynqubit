OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[1];
cx q[1], q[7];
cx q[1], q[4];
x q[5];
cx q[7], q[6];
