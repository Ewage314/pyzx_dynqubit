OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[1];
cx q[4], q[7];
cx q[1], q[4];
z q[2];
cx q[6], q[7];
cx q[7], q[4];
